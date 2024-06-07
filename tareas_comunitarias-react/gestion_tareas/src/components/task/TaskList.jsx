import React from 'react';

const TaskList = ({ tasks }) => {
    
  if (!Array.isArray(tasks)) {
    return <div>No hay tareas disponibles.</div>;
  }

  return (
    <div>
      <h1>Lista de Tareas</h1>
      <ul>
        {tasks.map(task => (
          <li key={task.id}>{task.title}</li>
        ))}
      </ul>
    </div>
  );
};

export default TaskList;
