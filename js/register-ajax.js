
function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}

var http = createRequestObject();

function loadDist() {
    st=document.getElementById("DdlState").value;
    http.open('get', '/udbhav/jsp/LoadDistrict.jsp?state=' + st);
    http.onreadystatechange = processDistResponse;
    http.send(null);
}

function processDistResponse() {
    if(http.readyState == 4){
        var response = http.responseText;        
        document.getElementById("div-district").innerHTML = response;
        document.getElementById("div-district").style.display="block";
        document.getElementById("div-district").style.visibility="visible";
    }
}


function loadTaluka() {
    dt=document.getElementById("DdlDistrict").value;
    http.open('get', '/udbhav/jsp/LoadTaluka.jsp?district=' + dt);
    http.onreadystatechange = processTalukaResponse;
    http.send(null);
}

function processTalukaResponse() {
    if(http.readyState == 4){
        var response = http.responseText;        
        document.getElementById("div-taluka").innerHTML = response; 
        document.getElementById("div-taluka").style.display="block";
        document.getElementById("div-taluka").style.visibility="visible";
    }
}

function checkUsername()
{
    un = document.getElementById("TxtUsername").value;
    http.open('get', '/udbhav/jsp/CheckUsername.jsp?uname=' + un);
    http.onreadystatechange = processUnameResponse;
    http.send(null);
}

function processUnameResponse() {
    if(http.readyState == 4){
        var response = http.responseText;        
        document.getElementById("div-unique-unm").innerHTML = response;
        document.getElementById("div-unique-unm").style.display="block";
        document.getElementById("div-unique-unm").style.visibility="visible";
    }
}