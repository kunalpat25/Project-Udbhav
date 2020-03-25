function showinfo()
{
    name= document.getElementById("TxtName").value;
    que=document.getElementById("TxtQuestion").value;
    document.getElementById("showname").style.visibility=visible;
    document.getElementById("showname").style.display=block;
    document.getElementById("showque").style.visibility=visible;
    document.getElementById("showque").style.display=block;
    document.getElementById("showname").innerHTML=name;
    document.getElementById("showque").innerHTML=que;

}