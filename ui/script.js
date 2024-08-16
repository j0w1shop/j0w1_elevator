window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === 'open') {
        document.getElementById('elevator-name').textContent = data.elevator;
        document.getElementById('current-floor').textContent = `${data.currentFloor}`;
        
        const floorList = document.getElementById('floor-list');
        floorList.innerHTML = '';

        data.floors.forEach(floor => {
            const div = document.createElement('div');
            div.className = 'floor-item';

            const label = document.createElement('p');
            label.textContent = floor.label;
            label.className = 'floor-label';
            
            const button = document.createElement('button');
            button.textContent = floor.planta;
            button.className = 'floor-button';
            button.addEventListener('click', () => {
                fetch(`https://${GetParentResourceName()}/selectFloor`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ elevator: data.elevator, floor: floor.label })
                });
            });

            div.appendChild(label);
            div.appendChild(button);
            floorList.appendChild(div);
        });

        document.getElementById('elevator-ui').classList.remove('hidden');
    } else if (data.action === 'close') {
        document.getElementById('elevator-ui').classList.add('hidden');
    }
});

document.getElementById('close-btn').addEventListener('click', () => {
    closeMenu();
});

function closeMenu() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        }
    });
}

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeMenu();
    }
});
