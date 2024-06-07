import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import './Register.css';
import axios from '../axiosConfig';

const Register = () => {
    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [error, setError] = useState(null);
    const navigate = useNavigate();

    const handleSubmit = (event) => {
        event.preventDefault();
    
        const userData = {
            name: username,
            email: email,
            password: password,
        };
        console.log(userData);
    
        axios.post('/api/register',userData)
        .then(
            (response)=>{
                console.log(response);
            }
        ).catch(
            (error)=>{
                console.log(error)
            }
        )
    };

    return (
        <>
            <img src="/Images/logo.jpg" alt="Logo de mi sitio" className="logo" />
            <div className="register-container">
                <form className="register-form" onSubmit={handleSubmit}>
                    <h2>Registrarse</h2>
                    <div className="form-group">
                        <label htmlFor="username">Nombre de Usuario</label>
                        <input
                            type="text"
                            id="username"
                            name="username"
                            value={username}
                            onChange={(event) => setUsername(event.target.value)}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="email">Correo Electrónico</label>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            value={email}
                            onChange={(event) => setEmail(event.target.value)}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="password">Contraseña</label>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            value={password}
                            onChange={(event) => setPassword(event.target.value)}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="confirm-password">Confirmar Contraseña</label>
                        <input
                            type="password"
                            id="confirm-password"
                            name="confirm-password"
                            value={confirmPassword}
                            onChange={(event) => setConfirmPassword(event.target.value)}
                            required
                        />
                    </div>
                    {error && <div className="error">{error}</div>}
                    <div className="form-group">
                        <button type="submit">Registrarse</button>
                    </div>
                    <div className="login-link">
                        <p>¿Ya tienes una cuenta? <a href="/login">Inicia Sesión</a></p>
                    </div>
                    <div className="home-link">
                        <p><a href="/">Volver al Inicio</a></p>
                    </div>
                </form>
            </div>
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
        </>
    );
};

export default Register;

