window.onload = function () {
	var current = null; // the state which cursor is pointing
	var map = {}; // map object, includes 

				//*** My ideal expectation
				// var map = {
				//	state: "Afganistan", 
				//	beento: false
				//};

	//useful objects
	var attr = { // attributes for "attr"
		fill: "#efefef",
		stroke: "#888",
		"stroke-width": .5,
		"stroke-linejoin": "round"
		};

    // Important --> Don't know what it does though
	var R = Raphael("holder_1000", "100%", "100%"); 
				
	R.setViewBox(0, 0, 1000, 400, true);

	render_map(R,map,attr);

	for (var state in map) {
   		map[state].color = Raphael.getColor();
   		(function (st, state) {
			st[0].style.cursor = "pointer";
			// "st.color" to access color

			// when cursor is on
			st[0].onmouseover = function () {
				current && map[current].animate({fill: "#efefef", stroke: "#666"}, 300);
				st.animate({fill: st.color, stroke: "#ccc"}, 300);
			};

			// when cursor clicks
			var flag = true;
			st[0].onclick = function () {
			//	if(confirm("Have you been to " + state + "?\nWrite something behind!" )) {
			//		st.animate({fill: st.color, stroke: "#ccc"}, 300);
			//		flag = false;
			//	}
			};

			// when cursor is away
			if(flag) {
			st[0].onmouseout = function () {
				st.animate({stroke: "#666",fill: "#efefef" }, 300);
			};
			}
						


		})(map[state], state);

	}; // end for

};