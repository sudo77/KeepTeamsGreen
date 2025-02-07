# KeepTeamsGreen

## Overview
KeepTeamsGreen is a tool designed to keep your Microsoft Teams status green by simulating mouse movements. This ensures that your status remains active and prevents it from automatically switching to "Away".

## Features
- Simulates mouse movements to keep the Teams status green.
- Displays a spinning wheel animation in the console.
- Adds a new `#` character every 10 seconds to indicate activity.

## Requirements
- PowerShell
- ps2exe module (for converting PowerShell scripts to executables)

## Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/schmidsebas/KeepTeamsGreen.git
    ```
2. Navigate to the project directory:
    ```sh
    cd KeepTeamsGreen
    ```
3. Install the required PowerShell module:
    ```powershell
    Install-Module -Name ps2exe
    ```

## Usage
1. Run the `keepTeamsgreen.ps1` script to start the tool:
    ```powershell
    .\keepTeamsgreen.ps1
    ```
2. To convert the script to an executable, use the `makeexe.ps1` script:
    ```powershell
    .\makeexe.ps1
    ```

## Files
- `keepTeamsgreen.ps1`: Main script to keep the Teams status green.
- `makeexe.ps1`: Script to convert the PowerShell script to an executable.
- `spinning.ps1`: Script to display a spinning wheel animation and add `#` characters every 10 seconds.
- `.gitignore`: Specifies files to be ignored by Git.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact
For any questions or inquiries, please contact [schmidsebas](mailto:schmidsebas@example.com).
