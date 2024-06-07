import React, { useState } from 'react';
import axios from 'axios';

const CategoryForm = ({ history }) => {
    const [formData, setFormData] = useState({
        nombre: '',
        descripcion: ''
    });

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await axios.post('/categorias', formData);
            history.push('/categories');
        } catch (error) {
            console.error('Error creating category:', error);
        }
    };

    return (
        <div>
            <h2>Crear Categoría</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value={formData.nombre} onChange={handleChange} />
                <label htmlFor="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" value={formData.descripcion} onChange={handleChange} />
                <button type="submit">Guardar</button>
            </form>
        </div>
    );
}

export default CategoryForm;
