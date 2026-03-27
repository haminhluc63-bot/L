<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Shop FF Vòng Quay PRO</title>

<style>
body {
    background: #0f172a;
    color: white;
    text-align: center;
    font-family: Arial;
}

h1 {
    color: gold;
}

#wheel-container {
    position: relative;
    width: 300px;
    height: 300px;
    margin: 30px auto;
}

#wheel {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    border: 6px solid gold;
    transition: transform 4s ease-out;
}

#spinBtn {
    margin-top: 20px;
    padding: 12px 25px;
    font-size: 18px;
    background: gold;
    border: none;
    border-radius: 10px;
}

.pointer {
    width: 0;
    height: 0;
    border-left: 15px solid transparent;
    border-right: 15px solid transparent;
    border-bottom: 30px solid red;
    position: absolute;
    top: -10px;
    left: 50%;
    transform: translateX(-50%);
}
</style>

</head>
<body>

<h1>🎮 Shop FF Vòng Quay PRO</h1>

<p>Kim cương: <span id="kc">1000</span> 💎</p>

<div id="wheel-container">
    <div class="pointer"></div>
    <canvas id="wheel" width="300" height="300"></canvas>
</div>

<button id="spinBtn">Quay (100 KC)</button>

<p id="result"></p>

<script>
const canvas = document.getElementById("wheel");
const ctx = canvas.getContext("2d");

let kc = 1000;
let spinning = false;

const rewards = [
    "50 KC",
    "200 KC",
    "Trượt",
    "Skin",
    "500 KC",
    "Trượt"
];

const colors = ["#f59e0b","#10b981","#ef4444","#3b82f6","#8b5cf6","#f43f5e"];

function drawWheel() {
    let angle = 2 * Math.PI / rewards.length;

    for (let i = 0; i < rewards.length; i++) {
        ctx.beginPath();
        ctx.fillStyle = colors[i];
        ctx.moveTo(150,150);
        ctx.arc(150,150,150,i*angle,(i+1)*angle);
        ctx.fill();

        ctx.fillStyle = "#fff";
        ctx.font = "14px Arial";
        ctx.translate(150,150);
        ctx.rotate(i * angle + angle/2);
        ctx.fillText(rewards[i], 50, 5);
        ctx.setTransform(1,0,0,1,0,0);
    }
}

drawWheel();

document.getElementById("spinBtn").onclick = function() {
    if (spinning) return;

    if (kc < 100) {
        alert("Không đủ KC!");
        return;
    }

    kc -= 100;
    document.getElementById("kc").innerText = kc;

    spinning = true;

    let deg = Math.floor(3000 + Math.random() * 2000);
    canvas.style.transform = "rotate(" + deg + "deg)";

    setTimeout(() => {
        spinning = false;

        let index = Math.floor(Math.random() * rewards.length);
        let result = rewards[index];

        document.getElementById("result").innerText = "Kết quả: " + result;

        if (result.includes("KC")) {
            let value = parseInt(result);
            kc += value;
            document.getElementById("kc").innerText = kc;
        }

    }, 4000);
};
</script>

</body>
</html>
