browser.tabs.query({active: true, currentWindow: true})
    .then(tabs => {
        for (const tab of tabs) {
            document.getElementById("title").value = tab.title;
            document.getElementById("url").value = tab.url;
        }
});

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById("submit").addEventListener('click',function (evt) {
        fetch("http://127.0.0.1:34810/?title="
            + encodeURIComponent(document.getElementById("title").value)
            + "&url=" + encodeURIComponent(document.getElementById("url").value)
            + "&tag=" + encodeURIComponent(document.getElementById("tags").value))
        .then(r => console.log(r));
    })
});
