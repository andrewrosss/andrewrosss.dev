import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="andrewrosss-dev",
    version="0.1.0",
    author="Andrew Ross",
    author_email="andrew.ross.mail@gmail.com",
    description="Andrew Ross' personal website",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/andrewrosss/andrewrosss.dev",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)