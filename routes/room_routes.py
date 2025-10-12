from flask import Blueprint, render_template

room_bp = Blueprint('room', __name__, url_prefix='/rooms')

@room_bp.route('/')
def view_rooms():
    # TODO: Fetch rooms from DB
    rooms = [
        {"id": 1, "type": "Single", "rent": 5000, "available": True},
        {"id": 2, "type": "Double", "rent": 8000, "available": False}
    ]
    return render_template('rooms.html', rooms=rooms)
