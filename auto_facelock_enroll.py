#!/usr/bin/env python3

import cv2
import numpy as np
import os
import argparse
import face_recognition
import tempfile
import shutil
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def capture_image():
    # Initialize webcam
    video_capture = cv2.VideoCapture(0)

    if not video_capture.isOpened():
        logger.error("Could not open webcam")
        return None

    # Capture a single frame
    ret, frame = video_capture.read()

    # Release the webcam
    video_capture.release()

    if not ret:
        logger.error("Failed to capture image")
        return None

    return frame

def save_image_with_increment(directory, base_filename, image):
    base, ext = os.path.splitext(base_filename)
    filename = os.path.join(directory, base + ext)
    i = 0
    while os.path.exists(filename):
        filename = os.path.join(directory, f"{base}_{i}{ext}")
        i += 1
    cv2.imwrite(filename, image)
    logger.info(f"Image saved as '{filename}'")
    return filename

def filter_background(image, padding=40):
    # Convert to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Load the pre-trained face detection model from OpenCV
    face_cascade_path = '/usr/share/opencv4/haarcascades/haarcascade_frontalface_default.xml'  # Adjust this path as needed
    if not os.path.exists(face_cascade_path):
        logger.error("Face cascade file not found at: %s", face_cascade_path)
        return None, None

    face_cascade = cv2.CascadeClassifier(face_cascade_path)

    if face_cascade.empty():
        logger.error("Failed to load face cascade")
        return None, None

    # Detect faces in the image
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    if len(faces) == 0:
        logger.warning("No face detected")
        return None, None

    # Create a mask with the same dimensions as the image, initialized to zeros (black)
    mask = np.zeros_like(image)

    # Draw white filled rectangles on the mask where faces are detected
    for (x, y, w, h) in faces:
        # Add padding to the detected face coordinates
        x_start = max(x - padding, 0)
        y_start = max(y - padding, 0)
        x_end = min(x + w + padding, image.shape[1])
        y_end = min(y + h + padding, image.shape[0])
        mask[y_start:y_end, x_start:x_end] = image[y_start:y_end, x_start:x_end]

    # Apply the mask to the original image
    result = cv2.bitwise_and(image, mask)

    # Crop the image to the bounding box of the face with padding
    for (x, y, w, h) in faces:
        x_start = max(x - padding, 0)
        y_start = max(y - padding, 0)
        x_end = min(x + w + padding, image.shape[1])
        y_end = min(y + h + padding, image.shape[0])
        cropped_result = result[y_start:y_end, x_start:x_end]
        break  # Assuming we only process the first detected face

    return cropped_result, faces[0]  # Return the cropped result and the face bounding box

def compare_faces(face_encodings):
    if len(face_encodings) < 2:
        logger.warning("Not enough faces to compare")
        return True

    for i in range(1, len(face_encodings)):
        match = face_recognition.compare_faces([face_encodings[0]], face_encodings[i])[0]
        if not match:
            return False

    return True

def main(num_captures):
    face_encodings = []

    with tempfile.TemporaryDirectory() as temp_dir:
        for _ in range(num_captures):
            image = capture_image()
            if image is not None:
                filtered_image, face_box = filter_background(image)
                if filtered_image is not None:
                    filename = save_image_with_increment(temp_dir, 'filtered_image.jpg', filtered_image)
                    top, right, bottom, left = face_box
                    face_image = image[top:bottom, left:right]
                    face_locations = [(0, right-left, bottom-top, 0)]
                    encodings = face_recognition.face_encodings(face_image, face_locations)
                    if encodings:
                        face_encodings.append(encodings[0])
                    else:
                        logger.warning("No face detected in %s", filename)
                        return
                else:
                    logger.error("Filtering failed")
                    return
            else:
                logger.error("No image captured")
                return

        if compare_faces(face_encodings):
            logger.info("All captured faces match.")
            known_faces_dir = '/usr/local/share/known_faces'
            if not os.path.exists(known_faces_dir):
                os.makedirs(known_faces_dir, mode=0o755, exist_ok=True)
                logger.info("Created directory: %s", known_faces_dir)
            for filename in os.listdir(temp_dir):
                src_file = os.path.join(temp_dir, filename)
                dst_file = os.path.join(known_faces_dir, filename)
                shutil.move(src_file, dst_file)
                logger.info("Moved '%s' to '%s'", src_file, dst_file)
        else:
            logger.warning("Captured faces do not match.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Capture and filter images, then compare faces.")
    parser.add_argument('--num_captures', type=int, default=10, help='Number of images to capture and compare')
    args = parser.parse_args()

    main(args.num_captures)
