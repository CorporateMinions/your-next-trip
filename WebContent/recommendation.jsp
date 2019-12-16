<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
  <script src="./js/jquery.min.js" type="text/javascript"></script>
  <script src="./js/popper.min.js" type="text/javascript"></script>
  <script src="./js/bootstrap.min.js" type="text/javascript"></script>
  <script src="./js/places.js" type="text/javascript"></script>

  <link href="./css/style.css" type="text/css" rel="stylesheet">
  <title>Recommend a Route | Your Next Trip</title>
</head>
<body>
<%@ include file="header.html" %>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-6 mx-auto my-5">
      <form id="geocodingInput">
        <div class="form-group">
          <label for="sourceInput">Starting address</label>
          <input type="text" class="form-control" id="sourceInput" placeholder="Enter an address..." />
        </div>
        <div class="form-group">
          <label for="destInput">Destination address</label>
          <input type="text" class="form-control" id="destInput" placeholder="Enter an address..." />
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 mx-auto">
      <div id="travelTypeOutput"></div>
    </div>
  </div>
</div>
<%@ include file="footer.html" %>
<script>
  const placesAutocomplete1 = places({
    appId: <%@include file="algolia-app-id"%>,
    apiKey: <%@include file="algolia-api-key"%>,
    container: document.querySelector('#sourceInput')
  });

  const placesAutocomplete2 = places({
    appId: <%@include file="algolia-app-id"%>,
    apiKey: <%@include file="algolia-api-key"%>,
    container: document.querySelector('#destInput')
  });

  const locations = {lat1: 0.0, lon1: 0.0, lat2: 0.0, lon2: 0.0};

  function haversineFormula(lat1,lon1,lat2,lon2) {
    const earthRadius = 6371; // km (change this constant to get miles)
    const distanceLatitute = (lat2 - lat1) * Math.PI / 180;
    const distanceLongitude = (lon2 - lon1) * Math.PI / 180;
    const a = Math.sin(distanceLatitute / 2) * Math.sin(distanceLatitute / 2) +
            Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
            Math.sin(distanceLongitude / 2) * Math.sin(distanceLongitude / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return earthRadius * c;
  }

  function showOutput(event) {
    event.preventDefault();
    const distance = haversineFormula(locations.lat1, locations.lon1, locations.lat2, locations.lon2);
    // TODO: Display recommendation in #travelTypeOutput
    document.getElementById("travelTypeOutput").textContent = distance + "km";
  }

  placesAutocomplete1.on('change', event => {
    if (event.suggestion.latlng !== undefined) {
      locations.lat1 = event.suggestion.latlng.lat;
      locations.lon1 = event.suggestion.latlng.lng;
    }
  });

  placesAutocomplete2.on('change', event => {
    if (event.suggestion.latlng !== undefined) {
      locations.lat2 = event.suggestion.latlng.lat;
      locations.lon2 = event.suggestion.latlng.lng;
    }
  });

  document.getElementById("geocodingInput").addEventListener('submit', showOutput, true);
</script>
</body>
</html>