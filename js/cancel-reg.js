function showCancelDiv()
{
    document.getElementById("div-cancel-registration").style.visibility="visible";
    document.getElementById("div-cancel-registration").style.display="block";
}


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

function cancelReg() {
    uid=document.getElementById("TxtUname").value;
    http.open('get', '/udbhav/jsp/CancelRegistration.jsp?uid=' + uid);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;        
        document.getElementById("message").innerHTML = response;
        
    }
}
