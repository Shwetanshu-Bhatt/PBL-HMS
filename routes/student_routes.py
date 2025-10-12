from flask import Blueprint, render_template

student_bp = Blueprint('student', __name__, url_prefix='/student')

# -----------------------------
# Student Dashboard
# -----------------------------
@student_bp.route('/dashboard')
def dashboard():
    # TODO: Fetch actual student data from DB
    dummy_data = {
        "name": "John Doe",
        "email": "john@example.com",
        "current_hostel": "Everest Hostel",
        "room_number": "A-101",
        "payment_status": "Paid"
    }
    return render_template('student_dashboard.html', student=dummy_data)



# -----------------------------
# View Hostels Page
# -----------------------------
@student_bp.route('/view_hostels')
def view_hostels():
    # TODO: Fetch hostel data from the database
    hostels = [
        {
            "Hostel_ID": 1,
            "Hostel_Name": "Everest Hostel",
            "Location": "Campus Block A",
            "Total_Rooms": 50,
            "Available_Rooms": 5,
            "Hostel_Type": "Boys",
            "Contact_Person": "Mr. Sharma",
            "Contact_Number": "9876543210",
            "Email": "everest@university.edu",
            "Description": "Spacious rooms with attached bathrooms."
        },
        {
            "Hostel_ID": 2,
            "Hostel_Name": "Himalaya Hostel",
            "Location": "Campus Block B",
            "Total_Rooms": 60,
            "Available_Rooms": 10,
            "Hostel_Type": "Girls",
            "Contact_Person": "Ms. Gupta",
            "Contact_Number": "9876501234",
            "Email": "himalaya@university.edu",
            "Description": "Clean and modern hostel for girls."
        }
    ]

    return render_template('view_hostels.html', hostels=hostels)

@student_bp.route('/my_bookings')
def my_bookings():
    # TODO: Fetch actual bookings for student
    bookings = [
        {"hostel": "Everest Hostel", "room": "A-101", "status": "Confirmed"},
        {"hostel": "Himalaya Hostel", "room": "B-202", "status": "Pending"}
    ]
    return render_template('my_bookings.html', bookings=bookings)

@student_bp.route('/profile')
def profile():
    # Dummy student data (replace with DB call later)
    student_info = {
        "name": "John Doe",
        "email": "john@example.com",
        "current_hostel": "Everest Hostel",
        "room_number": "A-101",
        "payment_status": "Paid"
    }
    return render_template('profile.html', student=student_info)
