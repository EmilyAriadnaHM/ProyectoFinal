import React, { useState } from 'react';
import axios from 'axios';

const TaskForm = ({ history }) => {
    const [formData, setFormData] = useState({
        titulo: '',
        descripcion: '',
        estado: 'pendiente', 
        categoria_id: ''
    });

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await axios.post('/tareas', formData);
            history.push('/tasks');
        } catch (error) {
            console.error('Error creating task:', error);
        }
    };

    return (
        <div>
            <h2>Crear Tarea</h2>
            <form onSubmit={handleSubmit}>
                <label htmlFor="titulo">Título:</label>
                <input type="text" id="titulo" name="titulo" value={formData.titulo} onChange={handleChange} />
                <label htmlFor="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" value={formData.descripcion} onChange={handleChange} />
                <label htmlFor="estado">Estado:</label>
                <select id="estado" name="estado" value={formData.estado} onChange={handleChange}>
                    <option value="pendiente">Pendiente</option>
                    <option value="en_proceso">En Proceso</option>
                    <option value="completada">Completada</option>
                </select>
                <label htmlFor="categoria_id">Categoría ID:</label>
                <input type="number" id="categoria_id" name="categoria_id" value={formData.categoria_id} onChange={handleChange} />
                <button type="submit">Guardar</button>
            </form>
        </div>
    );
}

export default TaskForm;
