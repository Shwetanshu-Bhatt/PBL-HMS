from flask import Blueprint, render_template, request, redirect, url_for, session

# Define blueprint only once
auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user_type = request.form.get('user_type', 'student')

        # Placeholder: authentication logic goes here

        if user_type == 'admin':
            return redirect(url_for('admin.dashboard'))  
        else:
            return redirect(url_for('student.dashboard')) 

    return render_template('login.html')

@auth_bp.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        # Placeholder: signup logic
        return redirect(url_for('auth.login'))
    return render_template('signup.html')

@auth_bp.route('/logout')
def logout():
    session.clear()  # clears user session
    return redirect(url_for('auth.login'))
