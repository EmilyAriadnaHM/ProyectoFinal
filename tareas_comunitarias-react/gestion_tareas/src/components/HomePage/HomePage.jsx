import React from 'react';
import { Link } from 'react-router-dom';
import './HomePage.css';

const HomePage = ({ username }) => {
    return (
        <div className="home-container">
            <header className='principal'>
                <img src="/Images/logo.jpg" alt="Logo de mi sitio" className="logo" />
                <h1 className="welcome-message">Bienvenido, {username}</h1>
                <nav className='navHome'>
                    <div className="button-container">
                        <Link to="/profile" className="nav-link">Perfil</Link>
                        <Link to="/actividades" className="nav-link">Actividades</Link>
                    </div>
                </nav>
            </header>

            <main>
                <section className="about-section">
                <h1>Comunidades Unidas</h1>
                    <p>
                        En nuestra plataforma, te ofrecemos una variedad de actividades comunitarias en las que puedes participar. Desde proyectos de voluntariado hasta eventos de limpieza y campañas de concienciación, hay muchas maneras en las que puedes contribuir y hacer una diferencia.
                    </p>
                    <p>
                        Tu participación es crucial para el éxito de nuestras iniciativas comunitarias. Juntos, podemos construir un entorno mejor y más saludable para todos. No esperes más, ¡únete hoy y comienza a hacer la diferencia en tu comunidad!
                    </p>
                   
                </section>
                <section className="consciousness-section">
                    <h2>Conciencia Ambiental</h2>
                    <div className="consciousness-box">
                        <p>
                            Es vital que todos pongamos de nuestra parte para cuidar el medio ambiente. Reducir, reutilizar y reciclar son acciones sencillas que pueden tener un gran impacto. 
                            Plantar árboles, reducir el consumo de plástico y optar por energías renovables son pasos importantes para garantizar un futuro sostenible.
                        </p>
                    </div>
                </section>

                <section className="images-section">
                    <img className="image-block" src="/Images/community1.jpg" alt="Imagen 1" />
                    <img className="image-block" src="/Images/community2.jpg" alt="Imagen 2" />
                    <img className="image-block" src="/Images/community3.jpg" alt="Imagen 3" />
                    <img className="image-block" src="/Images/community4.jpg" alt="Imagen 4" />
                    <img className="image-block" src="/Images/community5.jpg" alt="Imagen 5" />
                    <img className="image-block" src="/Images/community6.jpg" alt="Imagen 6" />
                    <img className="image-block" src="/Images/community7.jpg" alt="Imagen 7" />
                </section>
                <section className="about-section">
                <h1>Importancia de las Tareas Comunitarias</h1>
                    <p>
                        Las tareas comunitarias son fundamentales para mejorar nuestro entorno y abordar problemas que afectan a nuestra sociedad en el presente. Participar en estas actividades nos permite:
                    </p>
                    <ul>
                        <li><strong>Fortalecer el sentido de comunidad:</strong> Al trabajar juntos en proyectos comunes, fortalecemos los lazos entre vecinos y fomentamos un sentido de pertenencia y solidaridad.</li>
                        <li><strong>Mejorar nuestro entorno:</strong> Las tareas comunitarias, como la limpieza de espacios públicos, la reforestación y el mantenimiento de parques, contribuyen directamente a la calidad de vida en nuestras comunidades.</li>
                        <li><strong>Resolver problemas actuales:</strong> Muchas actividades comunitarias se centran en resolver problemas concretos, como la pobreza, la falta de acceso a recursos básicos, y la educación. Al participar, podemos hacer una diferencia significativa en la vida de las personas.</li>
                        <li><strong>Promover la sostenibilidad:</strong> Actividades como el reciclaje, la conservación del agua y la promoción de energías renovables ayudan a construir un futuro más sostenible para las próximas generaciones.</li>
                        <li><strong>Desarrollar habilidades:</strong> Participar en actividades comunitarias también es una excelente manera de adquirir nuevas habilidades, desde la jardinería y la construcción, hasta la organización de eventos y la gestión de proyectos.</li>
                    </ul>
                    </section>
                <section className="comments-section">
                    <h2>Comentarios de Usuarios</h2>
                </section>
                <section className="avisos-section">
                    <h2>Avisos</h2>
                </section>
            </main>

            <footer>
                <div>
                    <p>Contáctanos: info@tuplataforma.com</p>
                    <p>Teléfono: +1234567890</p>
                </div>
                <div>
                    <a href="#">Facebook</a>
                    <a href="#">Twitter</a>
                    <a href="#">Instagram</a>
                </div>
            </footer>
        </div>
    );
};

export default HomePage;
