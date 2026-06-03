const form = document.getElementById("registration-form");
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");
const confirmPassword = document.getElementById("confirmPassword");
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
    e.preventDefault();

    const isRequiredValid = checkRequired([username, email, password, confirmPassword]);

    let isUsernameValid = true;
    let isEmailValid = true;
    let isPasswordValid = true;

    if (username.value.trim() !== "") {
        isUsernameValid = checkLength(username, 3, 15);
    }
    
    if (email.value.trim() !== "") {
        isEmailValid = checkEmail(email);
    }

    if (password.value.trim() !== "") {
        isPasswordValid = checkLength(password, 6, 25);
    }

    const isPasswordMatch = checkPasswordMatch(password, confirmPassword);

    if (isRequiredValid && isUsernameValid && isEmailValid && isPasswordValid && isPasswordMatch) {
        
        const currentName = username.value.trim();
        let savedNames = JSON.parse(localStorage.getItem('usernames')) || [];
        
        if (!savedNames.includes(currentName)) {
            savedNames.push(currentName);
            localStorage.setItem('usernames', JSON.stringify(savedNames));
            loadSavedUsernames(); 
        } 

        alert("Chúc mừng bạn đã đăng ký thành công!");
        
        form.reset();
        document.querySelectorAll(".form-group").forEach((group) => {
            group.className = "form-group";
        });
    }
});

confirmPassword.addEventListener("input", function() {
    checkPasswordMatch(password, confirmPassword);
});

password.addEventListener("input", function() {
    if (confirmPassword.value !== "") {
        checkPasswordMatch(password, confirmPassword);
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
    if (input.id === "confirmPassword") return "Xác nhận mật khẩu";
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

function checkEmail(input) {
    const emailRegex = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
    
    if (emailRegex.test(input.value.trim())) {
        showSuccess(input);
        return true;
    } else {
        showError(input, "Email không hợp lệ (ví dụ: abc@gmail.com)");
        return false;
    }
}

function checkPasswordMatch(input1, input2) {   
    const pass = input1.value;
    const confirmPass = input2.value;

    if (confirmPass.trim() === "") {
        showError(input2, "Vui lòng xác nhận lại mật khẩu");
        return false;
    }

    if (pass.trim() === "") {
        showError(input2, "Vui lòng nhập mật khẩu ở trên trước");
        return false;
    }

    if (pass !== confirmPass) {
        showError(input2, "Mật khẩu không trùng nhau");
        return false;
    } else {
        showSuccess(input2); 
        return true;
    }
}