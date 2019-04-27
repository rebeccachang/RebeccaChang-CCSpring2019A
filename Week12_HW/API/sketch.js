/*
Rebecca C
Supposed to gather data from the city bike api and place points mapped on the canvas
based off where city bikes are located in the world
*/

var url = "http://api.citybik.es/v2/networks?fields=location"

//container for results
var results;

//boolean to make sure that we have our data 
var loaded = false;

//preload runs before setup
function preload(){
    results = httpGet(url, 'json', false, function(response){
        console.log(results);
        loaded = true;
    });
}

function setup(){
    createCanvas(800, 700);
    background(150);
}
    
function draw(){

    if(!loaded){
        return;
    }
    for (let i = 0; i < results.networks.length; i++){
        //find longitude and latitude
        var longitude = results.networks[i].location.longitude
        var latitude = results.networks[i].location.latitude
        //map to minimum and maximum latitude and longitude
        var x = map(longitude, -180, 180, 0, width)
        var y = map(latitude, -90, 90, 0, height)
        //circles for bike points
        circle(x, y, 5);
    } 
    
}