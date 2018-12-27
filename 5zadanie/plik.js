var started=0;
function start() {
    if(started)
        return;
    started=1;
    document.getElementById("wynik").innerHTML="0";
    document.getElementById("wynik").setAttribute("x",590);
    document.getElementById("napis").style.opacity=0;
    var lock1=0;
    var lock2=0;
    var plansza = document.getElementById("plansza");
    var ymin_planszy = parseInt(plansza.getAttribute("y"));
    var ymax_planszy = parseInt(plansza.getAttribute("y")) + parseInt(plansza.getAttribute("height"));
    var gracz1 = document.getElementById("gracz1");
    var gracz2 = document.getElementById("gracz2");
    var gracz_height=parseInt(gracz2.getAttribute("height"));
    var krazek = document.getElementById("krazek");
    window.onmousemove = function (e) {
        var ymouse = event.clientY;
        if (ymouse <= ymin_planszy) {
            gracz2.setAttribute("y", ymin_planszy);
            gracz1.setAttribute("y", ymin_planszy);
        } else if (ymouse >= (ymax_planszy-gracz_height)) {
            gracz2.setAttribute("y", ymax_planszy - gracz_height);
            gracz1.setAttribute("y", ymax_planszy - gracz_height);
        } else {
            gracz2.setAttribute("y", ymouse);
            gracz1.setAttribute("y", ymouse);
        }
    }
    var kierunek=Math.floor((Math.random() * 4) + 1);
    var speed=2;
    var old_krazekcx;
    var old_krazekcy;
    var timer = setInterval(
        function() {
            old_krazekcx=parseInt(krazek.getAttribute("cx"));
            old_krazekcy=parseInt(krazek.getAttribute("cy"));
            if(kierunek==1){
                krazek.setAttribute("cx",old_krazekcx+speed);
                krazek.setAttribute("cy",old_krazekcy-speed);
            }
            else if(kierunek==2){
                krazek.setAttribute("cx",old_krazekcx+speed);
                krazek.setAttribute("cy",old_krazekcy+speed);
            }
            else if(kierunek==3){
                krazek.setAttribute("cx",old_krazekcx-speed);
                krazek.setAttribute("cy",old_krazekcy+speed);
            }
            else if(kierunek==4){
                krazek.setAttribute("cx",old_krazekcx-speed);
                krazek.setAttribute("cy",old_krazekcy-speed);
            }
            //odbicia od scianek
            if(parseInt(krazek.getAttribute("cy"))<=ymin_planszy+parseInt(krazek.getAttribute("r"))){
                if(kierunek==1){
                    kierunek=2;
                }
                else if(kierunek==4){
                    kierunek=3;
                }
            }
            else if(parseInt(krazek.getAttribute("cy"))>=ymax_planszy-parseInt(krazek.getAttribute("r"))){
                if(kierunek==2){
                    kierunek=1;
                }
                else if(kierunek==3){
                    kierunek=4;
                }
            }
            //odbicia paletka
            if(parseInt(krazek.getAttribute("cx"))>=parseInt(gracz2.getAttribute("x"))-parseInt(krazek.getAttribute("r"))&& parseInt(krazek.getAttribute("cy"))>=parseInt(gracz2.getAttribute("y")) && parseInt(krazek.getAttribute("cy"))<=parseInt(gracz2.getAttribute("y"))+parseInt(gracz2.getAttribute("height"))){
                if(lock2==0) {
                if(kierunek==1){
                    kierunek=4;
                }
                else if(kierunek==2){
                    kierunek=3;
                }
                speed+=0.2;
                document.getElementById("wynik").innerHTML=parseInt(document.getElementById("wynik").innerHTML)+1;
                    if(parseInt(document.getElementById("wynik").innerHTML)==10)
                        document.getElementById("wynik").setAttribute("x",document.getElementById("wynik").getAttribute("x")-10);
                    lock2=1;
                    lock1=0;
                }
            }
            else if(parseInt(krazek.getAttribute("cx"))<=parseInt(gracz1.getAttribute("x"))+parseInt(gracz1.getAttribute("width"))+parseInt(krazek.getAttribute("r"))&& parseInt(krazek.getAttribute("cy"))>=parseInt(gracz1.getAttribute("y")) && parseInt(krazek.getAttribute("cy"))<=parseInt(gracz1.getAttribute("y"))+parseInt(gracz1.getAttribute("height"))){
                if(lock1==0) {
                if(kierunek==3){
                    kierunek=2;
                }
                else if(kierunek==4){
                    kierunek=1;
                }
                    speed += 0.2;
                    document.getElementById("wynik").innerHTML = parseInt(document.getElementById("wynik").innerHTML) + 1;
                    if(parseInt(document.getElementById("wynik").innerHTML)==10)
                        document.getElementById("wynik").setAttribute("x",document.getElementById("wynik").getAttribute("x")-10);
                    lock2=0;
                    lock1=1;
                }
            }
            //game over
            if(parseInt(krazek.getAttribute("cx"))<parseInt(gracz1.getAttribute("x"))-parseInt(krazek.getAttribute("r")) || parseInt(krazek.getAttribute("cx"))>parseInt(gracz2.getAttribute("x"))+parseInt(krazek.getAttribute("r"))+parseInt(gracz2.getAttribute("width"))){

                krazek.setAttribute("cx",600);
                krazek.setAttribute("cy",350);
                started=0;
                document.getElementById("napis").style.opacity=1;
                clearInterval(timer);
            }

        }
        ,1)
}
