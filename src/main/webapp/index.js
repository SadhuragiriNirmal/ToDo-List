window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    document.getElementById("navbar").style.backgroundColor = "#FFFFFF"; // Change background color when scrolled
    document.getElementById("nac1").style.color="darkgoldenrod";
    document.getElementById("nac2").style.color="darkgoldenrod";
    document.getElementById("nac3").style.color="darkgoldenrod";
    document.getElementById("nac4").style.color="darkgoldenrod";
    document.getElementById("nac5").style.color="darkgoldenrod";
    
  } else {
    document.getElementById("navbar").style.backgroundColor = "#352791"; // Revert to original background color
    document.getElementById("nac1").style.color="darkgoldenrod";
    document.getElementById("nac2").style.color="darkgoldenrod";
    document.getElementById("nac3").style.color="darkgoldenrod";
    document.getElementById("nac4").style.color="darkgoldenrod";
    document.getElementById("nac5").style.color="darkgoldenrod";
  }
}


