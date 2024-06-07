import React, { useEffect, useState } from 'react';
import axios from 'axios';

const CategoryList = () => {
    const [categories, setCategories] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchCategories = async () => {
            try {
                const response = await axios.get('/api/categorias');
                setCategories(response.data);
                setLoading(false);
            } catch (error) {
                console.error('Error fetching categories:', error);
                setError('Error fetching categories');
                setLoading(false);
            }
        };

        fetchCategories();
    }, []);

    const handleDeleteCategory = async (categoryId) => {
        try {
            await axios.delete(`/api/categorias/${categoryId}`);
            setCategories(categories.filter(category => category.id !== categoryId));
        } catch (error) {
            console.error('Error deleting category:', error);
        }
    };

    if (loading) return <div>Loading...</div>;
    if (error) return <div>{error}</div>;

    return (
        <div>
            <h2>Lista de Categorías</h2>
            <ul>
                {categories.map(category => (
                    <li key={category.id}>
                        {category.nombre}
                        <button onClick={() => handleDeleteCategory(category.id)}>Eliminar</button>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default CategoryList;