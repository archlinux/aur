#!/usr/bin/env python3

import face_recognition
import cv2
import os
import numpy as np
import subprocess
import time
import argparse
import tempfile
import logging
import pwd

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# Function to load known faces
def load_known_faces(known_faces_dir):
    known_faces = []
    known_names = []
    for filename in os.listdir(known_faces_dir):
        image_path = os.path.join(known_faces_dir, filename)
        image = face_recognition.load_image_file(image_path)
        encodings = face_recognition.face_encodings(image)
        if encodings:
            known_faces.append(encodings[0])
            known_names.append(os.path.splitext(filename)[0])
        else:
            logger.warning(f"No face found in {filename}, deleting file.")
    logger.info(f"Loaded {len(known_faces)} known face(s) from {known_faces_dir}")
    return known_faces, known_names

# Function to calculate the average brightness of an image
def calculate_brightness(image):
    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    brightness = np.mean(hsv[:, :, 2])
    return brightness

# Function to adjust the brightness and contrast of an image
def adjust_lighting(image, target_brightness=130):
    brightness = calculate_brightness(image)
    ratio = target_brightness / brightness
    adjusted = cv2.convertScaleAbs(image, alpha=ratio, beta=0)
    return adjusted

# Function to capture an image
def capture_image():
    video_capture = cv2.VideoCapture(0)
    if not video_capture.isOpened():
        logger.error("Could not open webcam")
        return None

    ret, frame = video_capture.read()
    video_capture.release()
    if not ret:
        logger.error("Failed to capture image")
        return None

    adjusted_frame = adjust_lighting(frame)
    return adjusted_frame

# Function to save image with an incremented filename in a temporary directory
def save_image_with_increment(tmp_dir, base_filename, image):
    base, ext = os.path.splitext(base_filename)
    filename = os.path.join(tmp_dir, base + ext)
    i = 0
    while os.path.exists(filename):
        filename = os.path.join(tmp_dir, f"{base}_{i}{ext}")
        i += 1
    cv2.imwrite(filename, image)
    logger.info(f"Image saved as '{filename}'")
    return filename

# Function to filter background and crop face
def filter_background(image, padding=40):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    face_cascade_path = '/usr/share/opencv4/haarcascades/haarcascade_frontalface_default.xml'  # Adjust path as needed
    face_cascade = cv2.CascadeClassifier(face_cascade_path)

    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
    if len(faces) == 0:
        logger.warning("No face detected")
        return None, None

    mask = np.zeros_like(image)
    for (x, y, w, h) in faces:
        x_start = max(x - padding, 0)
        y_start = max(y - padding, 0)
        x_end = min(x + w + padding, image.shape[1])
        y_end = min(y + h + padding, image.shape[0])
        mask[y_start:y_end, x_start:x_end] = image[y_start:y_end, x_start:x_end]

    result = cv2.bitwise_and(image, mask)
    for (x, y, w, h) in faces:
        x_start = max(x - padding, 0)
        y_start = max(y - padding, 0)
        x_end = min(x + w + padding, image.shape[1])
        y_end = min(y + h + padding, image.shape[0])
        cropped_result = result[y_start:y_end, x_start:x_end]
        break

    return cropped_result, (y, x + w, y + h, x)  # Return the correct face bounding box format

# Function to compare faces
def compare_faces(face_encodings):
    if len(face_encodings) < 2:
        logger.warning("Not enough faces to compare")
        return True

    for i in range(1, len(face_encodings)):
        match = face_recognition.compare_faces([face_encodings[0]], face_encodings[i])[0]
        if not match:
            return False

    return True

# Function to recognize face from the webcam
def recognize_face(known_faces, tmp_dir):
    image = capture_image()
    if image is None:
        logger.error("Failed to capture image from webcam")
        return None, None

    face_locations_original = face_recognition.face_locations(image)
    if len(face_locations_original) == 0:
        logger.warning("No face detected in the original captured image, trying again")
        return None, None

    save_image_with_increment(tmp_dir, 'captured_image.jpg', image)
    filtered_image, face_box = filter_background(image)
    if filtered_image is None:
        logger.warning("No face detected in captured image, trying again")
        return None, None

    save_image_with_increment(tmp_dir, 'filtered_image.jpg', filtered_image)

    face_encodings = face_recognition.face_encodings(image, face_locations_original)
    logger.info(f"Detected {len(face_encodings)} face encoding(s) in the original image")

    return face_encodings, face_box

# Function to lock the screen
def lock_screen(session_id):
    try:
        result = subprocess.run(["loginctl", "lock-session", session_id], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        logger.info("Screen locked successfully")
    except subprocess.CalledProcessError as e:
        logger.error(f"Failed to lock the screen: {e}")
        logger.error(f"Error output: {e.stderr.decode().strip()}")

# Function to get the current session ID
def get_session_id():
    try:
        user = os.getenv('USER') or pwd.getpwuid(os.getuid()).pw_name
        result = subprocess.run(["loginctl", "show-user", user, "--value", "-p", "Display"], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        session_id = result.stdout.decode().strip()
        return session_id
    except subprocess.CalledProcessError as e:
        logger.error(f"Failed to get session ID: {e}")
        return None

# Function to check if the session is active and unlocked
def is_session_active(session_id):
    try:
        result = subprocess.run(["loginctl", "show-session", session_id, "-p", "Active", "-p", "LockedHint"], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        output = result.stdout.decode().strip().split("\n")
        status = {line.split("=")[0]: line.split("=")[1] for line in output}
        return status.get("Active") == "yes" and status.get("LockedHint") == "no"
    except subprocess.CalledProcessError as e:
        logger.error(f"Failed to check session state: {e}")
        return False

# Main function
def main(known_faces_dir, check_interval, retries):
    known_faces, known_names = load_known_faces(known_faces_dir)
    if not known_faces:
        logger.error("No known faces loaded. Exiting.")
        return

    session_id = get_session_id()
    if not session_id:
        logger.error("Failed to retrieve session ID. Exiting.")
        return

    with tempfile.TemporaryDirectory(prefix="face_recognition_") as tmp_dir:
        while True:
            if is_session_active(session_id):
                unrecognized_count = 0
                for _ in range(retries):
                    face_encodings, face_box = recognize_face(known_faces, tmp_dir)
                    if face_encodings is None:
                        continue

                    recognized = False
                    for face_encoding in face_encodings:
                        matches = face_recognition.compare_faces(known_faces, face_encoding)
                        face_distances = face_recognition.face_distance(known_faces, face_encoding)
                        best_match_index = np.argmin(face_distances)
                        if matches[best_match_index]:
                            recognized = True
                            logger.info("Recognized face")
                            break

                    if not recognized:
                        unrecognized_count += 1
                        logger.warning("Unrecognized face, trying again")
                        break  # Retry immediately

                if unrecognized_count >= retries:
                    logger.warning("Unrecognized face detected, locking screen.")
                    lock_screen(session_id)
            else:
                logger.info("Session not active or locked, waiting...")
            time.sleep(check_interval)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Capture, filter, compare, and recognize faces to lock the screen if an unrecognized face is detected.")
    parser.add_argument('--known_faces_dir', type=str, default="/usr/local/share/known_faces", help='Directory containing known faces')
    parser.add_argument('--check_interval', type=int, default=60, help='Interval in seconds to check for unrecognized faces')
    parser.add_argument('--retries', type=int, default=2, help='Number of retries to confirm unrecognized face')
    args = parser.parse_args()

    main(args.known_faces_dir, args.check_interval, args.retries)
