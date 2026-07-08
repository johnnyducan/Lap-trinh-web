const form = document.getElementById("login-form");
const username = document.getElementById("username");
const password = document.getElementById("password");
const datalist = document.getElementById("saved-usernames"); 

document.addEventListener("DOMContentLoaded", function() {
    loadSavedUsernames();
});

function loadSavedUsernames() {
    const savedNames = JSON.parse(localStorage.getItem('usernames')) || [];
    
    if (datalist) {
        datalist.innerHTML = '';
        savedNames.forEach(name => {
            const option = document.createElement("option");
            option.value = name;
            datalist.appendChild(option);
        });
    }
}

form.addEventListener("submit", function(e) {
    const isRequiredValid = checkRequired([username, password]);

    let isUsernameValid = true;
    let isPasswordValid = true;

    if (username.value.trim() !== "") {
        isUsernameValid = checkLength(username, 3, 15);
    }
    
    if (password.value.trim() !== "") {
        isPasswordValid = checkLength(password, 3, 25);
    }

    if (!(isRequiredValid && isUsernameValid && isPasswordValid)) {
        e.preventDefault(); 
    } else {
        const currentName = username.value.trim();
        let savedNames = JSON.parse(localStorage.getItem('usernames')) || [];
        
        if (!savedNames.includes(currentName)) {
            savedNames.push(currentName);
            localStorage.setItem('usernames', JSON.stringify(savedNames));
        } 
    }
});

function checkRequired(inputArray) {
    let isValid = true;

    inputArray.forEach((input) => {
        if (input.value.trim() === "") {
            showError(input, `${formatFieldName(input)} không thể để trống`);
            isValid = false;
        } else {
            showSuccess(input);
        }
    });

    return isValid;
}

function formatFieldName(input) {
    return input.id.charAt(0).toUpperCase() + input.id.slice(1);
}

function showError(input, message) {
    const formGroup = input.parentElement;
    formGroup.className = "form-group error";
    const small = formGroup.querySelector("small");
    small.innerText = message;
}

function showSuccess(input) {
    const formGroup = input.parentElement;
    formGroup.className = "form-group success";
}

function checkLength(input, min, max) {
    const length = input.value.trim().length; 

    if (length < min) {
        showError(input, `${formatFieldName(input)} không thể nhập ít hơn ${min} ký tự`);
        return false;
    } else if (length > max) {
        showError(input, `${formatFieldName(input)} chỉ có thể nhập tối đa ${max} ký tự`);
        return false;
    } else {
        showSuccess(input);
        return true;
    }
}