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


function showProfile(userid) {
    
    
    http.open('get', '/udbhav/jsp/ShowCustProfile.jsp?id=' + userid);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;        
        document.getElementById("div-profile").innerHTML = response;
        document.getElementById("div-profile").style.display="block";
        document.getElementById("div-profile").style.visibility="visible";
    }
}