import React from 'react';
import { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './components/Home/Home'; 
import Login from './components/Login/Login';
import Register from './components/Register/Register';
import Activities from './components/Activities/Activities';
import UserProfile from './components/UserProfile/UserProfile';
import HomePage from './components/HomePage/HomePage';

function App() {
    return (
        <Router>
            <Routes>
                <Route exact path="/" element={<Home />} /> 
                <Route path="/login" element={<Login />} />
                <Route path="/register" element={<Register />} />
                <Route path="/actividades" element={<Activities />} /> 
                <Route path="/profile" element={<UserProfile />} /> 
                <Route path="/principal" element={<HomePage />} /> 
            </Routes>
        </Router>
    );
}

export default App; 
