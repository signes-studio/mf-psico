/**
 * Mireia Felici Psicología - Script Principal
 * Diseño, desarrollo y optimización por SIGNES.STUDIO
 */

document.addEventListener("DOMContentLoaded", () => {
    // 1. Barra de navegación - Estado de desplazamiento (scrolled)
    const navbar = document.getElementById('navbar');
    if (navbar) {
        const handleScroll = () => {
            navbar.classList.toggle('scrolled', window.scrollY > 10);
        };
        window.addEventListener('scroll', handleScroll, { passive: true });
        handleScroll();
    }

    // 2. Menú móvil accesible
    const toggle = document.getElementById('nav-toggle');
    const navLinks = document.getElementById('nav-links');
    if (toggle && navLinks) {
        toggle.addEventListener('click', () => {
            const isOpen = navLinks.classList.toggle('open');
            toggle.setAttribute('aria-expanded', String(isOpen));
            toggle.setAttribute('aria-label', isOpen ? 'Cerrar menú' : 'Abrir menú');
            document.body.style.overflow = isOpen ? 'hidden' : '';
        });

        navLinks.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('open');
                toggle.setAttribute('aria-expanded', 'false');
                toggle.setAttribute('aria-label', 'Abrir menú');
                document.body.style.overflow = '';
            });
        });
    }

    // 3. Banner de cookies y analítica con consentimiento
    initCookieConsent();

    // 4. Acordeón interactivo accesible de FAQs
    initFaqAccordion();

    // 5. Formulario de contacto asíncrono y accesible
    initContactForm();
});

/**
 * Gestión del consentimiento de cookies (RGPD / LOPD-GDD)
 */
function initCookieConsent() {
    const banner = document.getElementById("cookie-banner");
    const btnAccept = document.getElementById("accept-cookies");
    const btnReject = document.getElementById("reject-cookies");
    if (!banner || !btnAccept || !btnReject) return;

    const consent = localStorage.getItem("cookie-consent");
    if (consent === "accepted") {
        cargarStatcounter();
    } else if (consent === null) {
        setTimeout(() => {
            banner.classList.add("show");
            banner.setAttribute("aria-hidden", "false");
        }, 1000);
    }

    btnAccept.addEventListener("click", () => {
        localStorage.setItem("cookie-consent", "accepted");
        banner.classList.remove("show");
        banner.setAttribute("aria-hidden", "true");
        cargarStatcounter();
    });

    btnReject.addEventListener("click", () => {
        localStorage.setItem("cookie-consent", "rejected");
        banner.classList.remove("show");
        banner.setAttribute("aria-hidden", "true");
    });
}

/**
 * Carga diferida de Statcounter solo con consentimiento
 */
function cargarStatcounter() {
    if (window.sc_project) return;
    window.sc_project = 13335409; 
    window.sc_invisible = 1; 
    window.sc_security = "c7c7c2c2"; 

    const sc = document.createElement('script');
    sc.type = 'text/javascript';
    sc.async = true;
    sc.src = 'https://www.statcounter.com/counter/counter.js';
    document.head.appendChild(sc);
}

/**
 * Acordeón accesible de Preguntas Frecuentes
 */
function initFaqAccordion() {
    const faqButtons = document.querySelectorAll('.faq-question');
    if (!faqButtons.length) return;

    faqButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const item = btn.closest('.faq-item');
            if (!item) return;

            const isOpen = item.classList.contains('open');

            // Cierra el resto de items abiertos
            document.querySelectorAll('.faq-item.open').forEach(el => {
                if (el !== item) {
                    el.classList.remove('open');
                    el.querySelector('.faq-question')?.setAttribute('aria-expanded', 'false');
                }
            });

            // Conmuta el actual
            if (!isOpen) {
                item.classList.add('open');
                btn.setAttribute('aria-expanded', 'true');
            } else {
                item.classList.remove('open');
                btn.setAttribute('aria-expanded', 'false');
            }
        });
    });
}

/**
 * Gestión del formulario de contacto con Web3Forms / Formspree / Mailto Fallback
 */
function initContactForm() {
    const form = document.getElementById('contact-form');
    if (!form) return;

    const statusDiv = document.getElementById('form-status');
    const submitBtn = document.getElementById('btn-submit');

    form.addEventListener('submit', async function(e) {
        e.preventDefault();

        const nombreInput = document.getElementById('nombre');
        const emailInput = document.getElementById('email');
        const mensajeInput = document.getElementById('mensaje');
        const rgpdInput = document.getElementById('rgpd');

        if (!nombreInput || !emailInput || !mensajeInput) return;

        if (rgpdInput && !rgpdInput.checked) {
            if (statusDiv) {
                statusDiv.className = 'form-status error';
                statusDiv.textContent = 'Debes aceptar la política de privacidad para poder enviar tu consulta.';
            }
            return;
        }

        const nombre = nombreInput.value.trim();
        const email = emailInput.value.trim();
        const mensaje = mensajeInput.value.trim();

        if (!nombre || !email || !mensaje) {
            if (statusDiv) {
                statusDiv.className = 'form-status error';
                statusDiv.textContent = 'Por favor, completa todos los campos requeridos (*).';
            }
            return;
        }

        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.textContent = 'Enviando...';
        }

        if (statusDiv) {
            statusDiv.textContent = '';
            statusDiv.className = 'form-status';
        }

        try {
            const formData = new FormData(form);
            const response = await fetch(form.action, {
                method: 'POST',
                body: formData,
                headers: { 'Accept': 'application/json' }
            });

            if (response.ok) {
                if (statusDiv) {
                    statusDiv.className = 'form-status success';
                    statusDiv.textContent = '¡Gracias por escribirme! He recibido tu consulta correctamente y te responderé en un plazo máximo de 24-48 horas laborables.';
                }
                form.reset();
            } else {
                throw new Error('Error en el servicio de recepción');
            }
        } catch (error) {
            // Fallback con mailto seguro en caso de fallo de red o API no configurada
            const subject = encodeURIComponent('Consulta desde la web · ' + nombre);
            const body = encodeURIComponent('Hola Mireia,\n\n' + mensaje + '\n\nNombre: ' + nombre + '\nEmail: ' + email);
            window.location.href = 'mailto:hola@mireiafelici.es?subject=' + subject + '&body=' + body;

            if (statusDiv) {
                statusDiv.className = 'form-status success';
                statusDiv.textContent = 'Abriendo tu aplicación de correo para enviar el mensaje a hola@mireiafelici.es...';
            }
        } finally {
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.textContent = 'Enviar mensaje';
            }
        }
    });
}

