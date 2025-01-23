// Open and close UI
window.addEventListener("message", (event) => {
    if (event.data.type === "open") {
        document.getElementById("container").style.display = "block";
        document.getElementById("stationName").innerText = event.data.route;
    } else if (event.data.type === "close") {
        closeUI();
    }
});

document.getElementById("startAction").addEventListener("click", () => {
    const station = document.getElementById("stationName").innerText;
    fetch(`https://${GetParentResourceName()}/startAction`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ action: station })
    });
    closeUI();
});

document.getElementById("closeUI").addEventListener("click", () => {
    closeUI();
});

function closeUI() {
    document.getElementById("container").style.display = "none";
    fetch(`https://${GetParentResourceName()}/close`);
}

window.addEventListener("message", (event) => {
    if (event.data.type === "checkAd") {
        const ad = document.getElementById("advertisement");
        const exists = ad !== null;
        fetch(`https://${GetParentResourceName()}/checkAd`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ adExists: exists })
        });
    }
});

setInterval(() => {
    fetch(`https://${GetParentResourceName()}/checkAd`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ adExists: true })
    });
}, 5000);
