from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from models import Student, Admin
from extensions import db  

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username'].strip()
        password = request.form['password'].strip()
        user_type = request.form['user_type'].lower()

        # Select model and redirect target based on user type
        user_model = Admin if user_type == 'admin' else Student
        dashboard_endpoint = 'admin.dashboard' if user_type == 'admin' else 'student.dashboard'

        # Try to find user
        user = user_model.query.filter_by(Username=username).first()

        # Match password column correctly
        db_password = getattr(user, 'Password', None) or getattr(user, 'password', None)

        if user and db_password == password:
            session['username'] = username
            session['user_type'] = user_type.capitalize()
            flash(f"{user_type.capitalize()} login successful!", "success")
            return redirect(url_for(dashboard_endpoint))
        else:
            flash(f"Invalid {user_type} username or password.", "danger")

    return render_template('login.html')

@auth_bp.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        # Add signup logic if you want later
        return redirect(url_for('auth.login'))
    return render_template('signup.html')


@auth_bp.route('/logout')
def logout():
    session.clear()
    flash("Logged out successfully.", "info")
    return redirect(url_for('auth.login'))
