import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './Activities.css';

const Activities = () => {
    const [activities, setActivities] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8000/api/actividades')
            .then(response => {
                setActivities(response.data);
            })
            .catch(error => {
                console.error('Hubo un error al obtener las actividades:', error);
            });
    }, []);

    const getCategoryClass = (priority) => {
        switch (priority) {
            case 'High':
                return 'category-high';
            case 'Medium':
                return 'category-medium';
            case 'Low':
                return 'category-low';
            default:
                return '';
        }
    };

    return (
        <div className="activities-container">
            {activities.map((activity) => (
                <div key={activity.id} className="activity-card">
                    <div className="activity-header">
                        <div className="activity-title">{activity.nombre}</div>
                        <div className={`activity-category ${getCategoryClass(activity.prioridad)}`}>
                            {activity.prioridad}
                        </div>
                    </div>
                    <div className="activity-benefits">
                        <h3>Beneficios:</h3>
                        <ul>
                            {activity.beneficios.map((beneficio, index) => (
                                <li key={index}>{beneficio}</li>
                            ))}
                        </ul>
                    </div>
                    <div className="activity-footer">
                        <a href={`/activities/${activity.id}`}>Ver más detalles</a>
                    </div>
                </div>
            ))}
        </div>
    );
};

export default Activities;
