

var makecodeUrl = "makecode.microbit.org";
var blocksClass = "blocks";


var injectRenderer = function () {
    var f = $("<iframe>", {
        id: "makecoderenderer",
        src: `https://${makecodeUrl}/--docs?render=1&lang=${$('html').attr('lang')}`
    });
    f.css("position", "absolute");
    f.css("left", 0);
    f.css("bottom", 0);
    f.css("width", "1px");
    f.css("height", "1px");
    $('body').append(f);
}

function makeCodeRenderPre(pre) {
    var f = document.getElementById("makecoderenderer");
    f.contentWindow.postMessage({
        type: "renderblocks",
        id: pre.id,
        code: pre.innerText
    }, "*");
}

var attachBlocksListener = function () {
    var blockId = 0;
    window.addEventListener("message", function (ev) {
        var msg = ev.data;
        if (msg.source != "makecode") return;

        switch (msg.type) {
            case "renderready":
                $(`.${blocksClass}`).each(function () {
                    var codeDiv = $(this)[0];
                    codeDiv.id = `pxt-blocks-${blockId++}`;
                    makeCodeRenderPre(codeDiv);
                });
                break;
            case "renderblocks":
                var svg = msg.svg; // this is an string containing SVG
                var id = msg.id; // this is the id you sent
                // replace text with svg
                var img = document.createElement("img");
                img.src = msg.uri;
                img.width = msg.width;
                img.height = msg.height;
                var code = document.getElementById(id)
                code.parentElement.insertBefore(img, code)
                code.parentElement.removeChild(code);
                break;
        }
    }, false);
}

$(function () {
    injectRenderer();
    attachBlocksListener();
});