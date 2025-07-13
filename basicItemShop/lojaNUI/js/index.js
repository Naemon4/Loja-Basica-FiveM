function displayStatus(bool) {

    let shop = document.getElementById('shop')

    if (bool == true) {
        shop.style.display = 'inline'
    } else {
        shop.style.display = 'none'
    }

}

window.addEventListener('message', (event) => {

    let displayCall = event.status;
    let messageType = event.messageType;

    if (messageType == 'ui') {
        if (displayCall == true) {
            displayStatus(displayCall)
        } else {
            displayStatus(displayCall)
        }
    }

    //fecha a janela com o esc
    document.addEventListener('keyup', function (event) {
        if (event.key === 'Escape') {
            displayStatus(false);
        }

        axios.post('https://${GetParentResouceName()}/exit', {
            display: false
        })
        .then(response => {
            console.log('Resposta:', response.data);
        })
        .catch(error => {
            console.error('Erro no POST:', error);
        });

    });



})