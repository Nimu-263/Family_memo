function memo() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));

    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/homes", true);
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.memo;
      const list = document.getElementById("list");
      const memoTitle = document.getElementById("title");
      const memoContent = document.getElementById("content");

      if (item.id != null) {
        const HTML = `
          <div class="memo" data-id=${item.id}>
            <div class="memo-date">
              ${item.created_at}
            </div>
            <div class="memo-content">
              To：${item.title}
              ${item.content}
            </div>
          </div>`;
        list.insertAdjacentHTML("afterend", HTML);
      }
      memoTitle.value = "";
      memoContent.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);