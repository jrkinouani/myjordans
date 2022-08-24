function processBooking(id, action) {
  return fetch("/bookings/" + id + ".json", {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ status: action }),
  })
    .then((response) => response.text())
    .then(() => {
      alert(`Booking ${action}");
    })
    .catch((error) => alert("Error: " + error));
}
