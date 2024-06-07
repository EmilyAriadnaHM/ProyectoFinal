import React from 'react';

import './UserProfile.css';


const UserProfile = ({ username }) => {

    const handleActivitiesClick = () => {

        console.log('Redirigiendo a la página de actividades');
    };

    const handleLogout = () => {
        console.log('Cerrando sesión y redirigiendo al home');
    };

    return (
        <div className="user-profile">
            <img src="/Images/logo.jpg" alt="Logo de mi sitio" className="logo" />
            <h1 className="welcome-message">Bienvenido, {username}</h1>
            <h2 className="profile-title">Mi perfil</h2>
            <p className="profile-description">
                Aquí puedes ver y gestionar tu perfil de usuario. Puedes editar la información, ver tus actividades, y más.
            </p>
            <section className="photos-section">
                <h3>Fotos de Actividades</h3>
            </section>
            <section className="activities-section">
                <h3>Actividades Inscritas</h3>
            </section>
            <button className="activities-button" onClick={handleActivitiesClick}>Ver Actividades</button>
            <button className="logout-button" onClick={handleLogout}>Cerrar Sesión</button>
            <footer className="footer">
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

export default UserProfile;

