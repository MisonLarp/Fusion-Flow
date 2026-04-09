<div align="center">

# 🔌 FFlow — Troubleshooting Guide

**Resolving connection failures between FFlow and DaVinci Resolve**

</div>

---

> [!IMPORTANT]
> Before following this guide, read the **main README** included in the FFlow folder and complete the standard installation steps. This document is intended exclusively for **persistent errors** that are not resolved by the normal process.

<br>

## Table of Contents

- [Mandatory Requirement](#%EF%B8%8F-mandatory-requirement)
- [Step 1 — Set the Path Manually](#step-1--set-the-path-manually)
- [Step 2 — Reinstall Python with Geek Uninstaller](#step-2--reinstall-python-with-geek-uninstaller)
- [Step 3 — Deep Cleanup with Everything](#step-3--deep-cleanup-with-everything)
- [Still not working?](#still-not-working)

<br>

## ⚙️ Mandatory Requirement

Before anything else, make sure this setting is enabled inside DaVinci Resolve:

```
DaVinci Resolve → Preferences → System → General → External Scripting Using → Local
```

> [!WARNING]
> Without this setting active, FFlow **cannot communicate with Resolve** under any circumstances. Always verify this first.

<br>

---

## Step 1 — Set the Path Manually

If FFlow still doesn't work after using the **Default** button to set the installation path, configure it manually.

> [!NOTE]
> Windows handles folder paths in a particular way and the automatic button may not resolve this correctly on all systems.

**Steps:**

1. Open FFlow's settings.
2. In the path field, type the full installation path manually instead of using the Default button.
3. Save the changes and restart FFlow.

<br>

---

## Step 2 — Reinstall Python with Geek Uninstaller

If the issue persists, there is likely a conflicting or incomplete Python installation on the system. The fix is to remove it entirely and reinstall the correct version.

### 2a. Uninstall all Python versions

1. Download **Geek Uninstaller** → https://geekuninstaller.com/
   > Download the **ZIP file**, extract it and run `geek.exe`. No installation required.
2. Once open, locate **all** entries related to Python in the program list.
3. Select all Python entries, then right-click and choose **Uninstall** → when prompted, confirm and let each uninstaller run.
4. After all uninstallers have finished, Geek Uninstaller will prompt you to **remove leftover registry entries** — select all of them and click **Finish** to fully purge any remaining traces.

> [!CAUTION]
> If any entry **cannot be deleted**, right-click it and select **Force Remove** to forcibly eliminate it from the registry.

5. **Do not restart yet** — continue with the steps below first.

<br>

### 2b. Clean Python Registry Keys Manually

> [!NOTE]
> This step is **required** if you previously uninstalled Python using Windows' built-in uninstaller or the Add/Remove Programs panel instead of Geek Uninstaller. Those methods often leave registry entries behind that cause conflicts with fresh installations.

Open **Registry Editor** (`Win + R` → type `regedit` → press Enter), then navigate to and **delete** the following keys if they exist:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Python
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Python
HKEY_CURRENT_USER\SOFTWARE\Python
```

Additionally, check and clean these keys if present:

```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
```
> Inside this key, look for any `PYTHONPATH`, `PYTHONHOME`, or `PYTHONSTARTUP` **values** and delete them individually — do **not** delete the key itself.

```
HKEY_CURRENT_USER\Environment
```
> Same as above — remove only Python-related environment variable entries, not the key.

> [!CAUTION]
> Only delete the **Python-specific keys and values** listed above. Do not delete or modify anything else in the registry.

Once done, **restart your computer** before continuing.

<br>

### 2c. Disable Python App Execution Aliases

Windows includes a feature called **App Execution Aliases** that can redirect `python.exe` and `python3.exe` calls to the Microsoft Store instead of your actual installation. This silently breaks FFlow's ability to locate Python.

**To disable it:**

1. Open **Settings** → **Apps** → **Advanced app settings** → **App execution aliases**.
2. Find the entries named **Python** and **Python3** (they may appear as `python.exe` and `python3.exe`).
3. Toggle **both of them OFF**.

> [!WARNING]
> If these aliases are left enabled, Windows may intercept Python calls even after a correct installation, causing FFlow to report that Python is not found or not responding.

<br>

### 2d. Install Python 3.10.11

1. Use the **Python 3.10.11** installer included in the FFlow folder.
2. On the first screen of the installer, check this option **before** clicking Install Now:

   ```
   ✅ Add Python 3.10 to PATH
   ```

3. Complete the installation and test FFlow again.

<br>

---

## Step 3 — Deep Cleanup with Everything

If residual files from previous Python installations remain and Geek Uninstaller did not catch them, use **Everything** to locate and delete them manually.

1. Download and install **Everything** → https://www.voidtools.com/
   > Any available version works.
2. Once open, search for the following terms one at a time:
   - `python`
   - `Python310`
   - `Python3`
3. Review the results and delete all files and folders related to Python that you find.

> [!CAUTION]
> If a file or folder **cannot be deleted** (access denied or locked), right-click it and open its location in Explorer, then delete it from an **Administrator Command Prompt** using:
> ```
> rd /s /q "C:\full\path\to\folder"
> ```
> Alternatively, use **[System Informer](https://github.com/winsiderss/systeminformer/releases)** (open source, formerly Process Hacker) to identify which process is locking the file, close its handle, and then delete it normally.

4. Reinstall **Python 3.10.11** from the FFlow folder, making sure to check **Add Python 3.10 to PATH** as in the previous step.

<br>

---

## Still not working?

> [!CAUTION]
> If you completed all the steps above and FFlow still fails to connect, this is likely an unresolved bug on our end.

Reach out in the help channel on the **CloudVFX Discord server**. To help us assist you faster, briefly describe the steps you already completed.

<br>

---

<div align="center">

| Step | Action | Tool Required |
|:----:|--------|---------------|
| — | Enable External Scripting in DaVinci Resolve | DaVinci Resolve |
| 1 | Set the installation path manually in FFlow | FFlow |
| 2a | Remove all Python versions | [Geek Uninstaller](https://geekuninstaller.com/) |
| 2b | Clean Python registry keys manually | regedit |
| 2c | Disable Python App Execution Aliases | Windows Settings |
| 2d | Reinstall Python 3.10.11 | Python 3.10.11 (included) |
| 3 | Deep cleanup of remaining Python files | [Everything](https://www.voidtools.com/) |
| 4 | Contact support | CloudVFX Discord |

<br>

*CloudVFX · FFlow Troubleshooting Guide*

</div>
