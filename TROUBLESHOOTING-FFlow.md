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

5. **Restart your computer** before continuing.

### 2b. Install Python 3.10.11

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
> Alternatively, use a tool like **[Unlocker](https://unlocker.en.softonic.com/)** to force-remove locked files.

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
| 2 | Remove all Python versions + reinstall 3.10.11 | [Geek Uninstaller](https://geekuninstaller.com/) |
| 3 | Deep cleanup of remaining Python files | [Everything](https://www.voidtools.com/) |
| 4 | Contact support | Cloud City Discord |

<br>

*Cloud City · FFlow Troubleshooting Guide*

</div>
