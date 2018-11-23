/**
 * 
 */
function editMenu() {
	var test = document.getElementById("afficheDetail").value;
	console.log(test);
	
	if(test != null){
		if (test == "1") {
			document.getElementById("container").style.display = "block";
			document.getElementById("formDelete").style.display = "block";
			test=0;
		}
	}
}

function editAliment() {
	var test2 = document.getElementById("afficheAjoutAliment").value;
	
	if(test2 != null){
		if (test2 == "1") {
			document.getElementById("ajoutAlimentMenu").style.display = "block";
			test2=0;
		}
	}
}

function terminer(){
	document.getelementbyId("btnterminer").addeventlistener("click", function() {
		document.getelementbyId("ajoutAlimentMenu").style.display = "none";
	});
}


document.addEventListener("DOMContentLoaded", function(event) {
	editMenu();
	editAliment();
	terminer();
});
