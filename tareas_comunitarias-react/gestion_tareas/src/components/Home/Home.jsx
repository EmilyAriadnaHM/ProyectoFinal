import React from 'react';
import { Link } from 'react-router-dom';
import './Home.css';

const Header = () => {
    return (
        <header>
            
            <img src="/Images/logo.jpg" alt="Logo de mi sitio" className="logo-home" />
            
            <nav>
                <ul>
                    <li><a href="/">Actividades</a></li>
                    <li><a href="/actividades">Tu opinión cuenta</a></li>
                    <li><a href="/actividades">Acerca de</a></li>
                </ul>
            </nav>

             <div className="auth-buttons">
                <Link to="/login">Iniciar Sesión</Link>
                <Link to="/register">Registrarse</Link>
            </div>
        </header>
    );
};

const MainContent = () => {
    return (
        <main>
            <section>
            <img src="/Images/welcome.jpg" alt="Bienvenida" className="welcome" />
                <h1>Bienvenido a nuestra plataforma de actividades comunitarias</h1>
                <p>
                    En nuestra plataforma, podrás participar en diversas actividades comunitarias y compartir experiencias con otros miembros de la comunidad.
                </p>
                <h2>Nuestro Propósito</h2>
                <p className="proposito">
                    Nuestra plataforma está diseñada para fortalecer el tejido social y fomentar la colaboración comunitaria. Queremos empoderar a los individuos para que se conviertan en agentes de cambio en sus comunidades. A través de nuestra plataforma, los usuarios pueden descubrir y participar en actividades que promuevan el bienestar social, el cuidado del medio ambiente, la educación y el desarrollo cultural. Nuestro objetivo es crear un espacio inclusivo y accesible donde todos puedan contribuir a la mejora de su entorno, compartiendo conocimientos, habilidades y recursos para construir un futuro más justo y sostenible.
                </p>
            </section>
            <section>
                <h2>¿Listo para unirte?</h2>
                <a href="/register" className="cta-button">Regístrate ahora</a>
            </section>
        </main>
    );
};

const Footer = () => {
    return (
        <footer>
            <div>
                <p>Contáctanos: info@tuplataforma.com</p>
                <p>Teléfono: +1234567890</p>
            </div>

            <div>
                <p>Cuidemos de nosotros</p>
                
                {/*<a href="#">Facebook</a>
                <a href="#">Twitter</a>
                <a href="#">Instagram</a>*/}
            </div>
        </footer>
    );
};

const Home = () => {
    return (
        <div className="container">
            <Header />
            <MainContent />
            <Footer />
        </div>
    );
};

export default Home;
