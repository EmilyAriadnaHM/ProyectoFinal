
import React, { useState, useEffect } from 'react';

import axios from 'axios';

const TaskDetails = ({ taskId }) => {
    const [task, setTask] = useState(null);

    useEffect(() => {
        const fetchTaskDetails = async () => {
            try {
                const response = await axios.get(`/tareas/${taskId}`);
                setTask(response.data);
            } catch (error) {
                console.error('Error fetching task details:', error);
            }
        };

        fetchTaskDetails();
    }, [taskId]);

    if (!task) {
        return <div>Cargando...</div>;
    }

    return (
        <div>
            <h2>Detalles de Tarea</h2>
            <p>Título: {task.titulo}</p>
            <p>Descripción: {task.descripcion}</p>
            <p>Estado: {task.estado}</p>
        </div>
    );
};

export default TaskDetails;
