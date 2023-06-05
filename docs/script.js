$("#imgPerfil").on({
    click:()=>{$("#nome").css("color", "red")},
    mouseenter:()=>{$("body").css("background-color", "purple")},
    mouseleave:()=>{$("body").css("background-color", "white")}
})

$("#btnPerfil").click(()=>{
    let ajaxTeste = new XMLHttpRequest();
    ajaxTeste.onreadystatechange = ()=>{
        document.getElementById("nome").innerHTML = this.responseText;
    }

    ajaxTeste.open("GET", "caminhoDaImg.txt", true);
    ajaxTeste.send();
})