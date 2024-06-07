import React, { useState, useEffect } from 'react';
import axios from 'axios';

const CategoryDetails = ({ match }) => {
    const [category, setCategory] = useState({});

    useEffect(() => {
        const fetchCategory = async () => {
            try {
                const response = await axios.get(`/categorias/${match.params.id}`);
                setCategory(response.data);
            } catch (error) {
                console.error('Error fetching category details:', error);
            }
        };

        fetchCategory();
    }, [match.params.id]);

    return (
        <div>
            <h2>Detalles de Categoría</h2>
            <p>ID: {category.id}</p>
            <p>Nombre: {category.nombre}</p>
            <p>Descripción: {category.descripcion}</p>
        </div>
    );
}

export default CategoryDetails;
