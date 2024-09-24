# Image-Cropping-Using-Seam-Carving

This project implements seam carving techniques using various energy maps, including gradient, saliency, depth map, and edge detection. By applying different coefficients to these energy maps, the project effectively preserves important image features while reducing image size.

## Features

- **Seam Carving**: Dynamic resizing of images while maintaining important content.
- **Multiple Energy Maps**: Utilizes different energy maps:
  - **Gradient**: Measures the intensity change to highlight edges.
  - **Saliency**: Identifies and retains important objects in the image.
  - **Depth Map**: Uses depth information to maintain three-dimensional perception.
  - **Edge Detection**: Focuses on edge information to preserve structural details.
- **Coefficient Adjustment**: Allows customization of the contribution of each energy map to the final result.

## Usage

To run the project, follow these steps:

1. Ensure you have MATLAB installed on your machine.
2. Open MATLAB and navigate to the project directory.
3. Adjust any parameters or coefficients in the `main.m` script as needed.
4. Run the `main.m` script.

```matlab
run main.m
