FROM python:3.12.11-trixie

# Create a non-root user
RUN useradd -m appuser

# Create the /private directory and assign ownership
RUN mkdir -p /private && chown -R appuser:appuser /private

# Switch to non-root user by default
USER appuser

# Set working directory
WORKDIR /private

# Optional: copy requirements and install dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Default command
CMD ["bash"]
