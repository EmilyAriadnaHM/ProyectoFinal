import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import './Login.css'; 

const Login = ({ setUser }) => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('password');
    const [error, setError] = useState(null); 
    const navigate = useNavigate();

    const handleSubmit = (event) => {
        event.preventDefault();
        axios.post('/api/login', { email, password })
            .then((response) => {
                console.log(response); 
                //navigate('/')
                localStorage.setItem('token', response.data.token);
                //setUser(response.data.user);
                navigate('/');
            })
            .catch((error) => {
                setError('Correo electrónico o contraseña incorrectos');
            });
    };

    return (
        <>
            <img src="/Images/logo.jpg" alt="Logo de mi sitio" className="logo" />
            <div className="login-container">
                <form className="login-form" onSubmit={handleSubmit}>
                    <h2>Iniciar Sesión</h2>
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
                    {error && <div className="error">{error}</div>} 
                    <div className="form-group">
                        <button type="submit">Iniciar Sesión</button>
                    </div>
                    <div className="register-link">
                        <p>¿No tienes una cuenta? <a href="/register">Regístrate</a></p>
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

export default Login;
