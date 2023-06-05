$("#imgPerfil").on({
    click:()=>{$("#nome").css("color", "red")},
    mouseenter:()=>{$("body").css("background-color", "purple")},
    mouseleave:()=>{$("body").css("background-color", "white")}
})

var btnPerfil = document.getElementById("btnPerfil");

btnPerfil.addEventListener('click', teste);

function teste(){
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function(){
        document.getElementById("nome").innerHTML = this.responseText;
    }

    xhttp.open('GET', 'file.txt', true);
    xhttp.send();

    console.log("testando")
}