from flask import Blueprint, render_template

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')

@admin_bp.route('/dashboard')
def dashboard():
    hostels = [
        {"name": "Everest Hostel", "rooms": 20, "available": 5},
        {"name": "Himalaya Hostel", "rooms": 15, "available": 3}
    ]
    student_requests = [
        {"student": "Aman", "request": "Room change"},
        {"student": "Ravi", "request": "Rent query"}
    ]
    return render_template('admin_dashboard.html', hostels=hostels, requests=student_requests)

@admin_bp.route('/logs')
def logs():
    try:
        with open('login_logs.txt', 'r') as f:
            logs = f.readlines()
    except FileNotFoundError:
        logs = ["No logs yet."]
    return render_template('logs.html', logs=logs)

# @admin_bp.route('/logs')
# def logs():
#     return render_template('logs.html', logs=logs)

