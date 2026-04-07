# 🎬 Fusion Flow <span><img src="https://github.com/MisonLarp/Fusion-Flow/blob/3faa85e4d301ffd46a12afc4e649665baecb81a3/Icon.png" width="35" height="35" style="margin-right: 10px; vertical-align: middle;" /></span>

> **Precision Bezier curve editing for DaVinci Resolve Fusion** — where complex animations meets supercalifragilisticexpialidocious simplicity.

![Fusion Flow Banner](https://img.shields.io/badge/DaVinci%20Resolve-Fusion%20Page-20B2AA?style=for-the-badge&logo=davinciresolve&logoColor=white)
![Status](https://img.shields.io/badge/Status-Production%20Ready-00D26A?style=for-the-badge)
![Python](https://img.shields.io/badge/Python-3.10-3776AB?style=for-the-badge&logo=python&logoColor=white)

---

## ✨ What Is Fusion Flow?

Fusion Flow (FFlow for short) is a standalone bezier curve editor that seamlessly integrates with DaVinci Resolve's Fusion page. Stop struggling with Fusions flawed spline editor FFlow gives you **professional-grade control** over animation curves with an intuitive, spacious interface.

### Why You'll Love It

- 🎯 **Precision Control** — Drag control points with pixel-perfect accuracy
- ⚡ **Instant Preview** — See changes apply to your timeline in real-time
- 🎨 **Multiple Presets** — 6 curve presets (Linear, Ease-In, Ease-Out, Ease-In-Out, Custom shapes, and more)
- 🔧 **Seamless Integration** — Works directly with DaVinci Resolve's native curves
- 🎓 **Built-in Tutorial** — Learn as you go with integrated guidance
- 🗨️ **Language Support** — Translated into 3+ Languages
- 🎨 **Themes** — Lots of customization options to express your vibe

---
| Fluid UI | Fusion UI |
|---------|---------|
| ![Curve Editor Green](https://github.com/MisonLarp/Fusion-Flow/blob/0ace2cd2b0027ad528001bdde3580ca85eb941bd/Fluid%20UI.png) | ![Curve Editor Orange](https://github.com/MisonLarp/Fusion-Flow/blob/0ace2cd2b0027ad528001bdde3580ca85eb941bd/Fusion%20UI.png) |
---
## 🚀 Quick Start

### Prerequisites

Before you begin, ensure you have:
- **Windows 10/11** (DaVinci Resolve requirement)
- **DaVinci Resolve Studio** (free version is not supported, [check out Flowy](https://www.youtube.com/watch?v=_DduLFqaoVc))
- **Admin access** for Python installation

### Step 1: Install Python

⚠️ **Critical:** Ensure no other Python version is installed before proceeding.

1. **Download & Run** `python-3.10.11.exe`
2. **⚙️ IMPORTANT:** Check the box that says **"Add Python to PATH"**
   - This is the #1 reason installations fail. Don't skip it.
3. Click through the installer

```bash
# Verify Python installation
python --version  # Should show Python 3.10.11
```

### Step 2: Open DaVinci Resolve

1. Launch **DaVinci Resolve**
2. Open or create a project
3. Navigate to the **Fusion page**

### Step 3: Start Fusion Flow

1. **Run** `FFLOW.exe`
2. Click the **⚙️ Settings** icon
3. Go to the **"General"** tab
4. Click **"Default Path"**
   - The app will automatically detect your DaVinci Resolve Developer folder
   - If not found: manually select your DaVinci Resolve installation folder
5. **Close** the settings window

### Step 4: You're Ready!

A built-in tutorial will guide you through the essentials. Alternatively, watch [Clout's video tutorial](https://www.youtube.com/watch?v=keNc6KjVTOc) for a walkthrough.

---

## ⚠️ Common Issues & Solutions

### "It won't work!"

Before panicking, check these three things:

| Problem | Solution |
|---------|----------|
| **Python error on startup** | You didn't check "Add Python to PATH" during installation. Reinstall Python and make sure to tick the box. |
| **Won't connect to Fusion** | Make sure you opened the **Fusion page** before launching Fusion Flow. The app only detects Fusion when it's active on the Fusion tab. |
| **Wrong DaVinci path** | Go to Settings → General → Clear the path and click "Default Path" again. If that doesn't work, manually navigate to your DaVinci Resolve installation folder. |
| **Still broken?** | See [TROUBLESHOOTING-FFlow.md](TROUBLESHOOTING-FFlow.md) for advanced solutions. |

### Getting Help

1. **Check the built-in tutorial** — It covers 90% of questions
2. **Watch the video guide** — Visual learners, this is for you
3. **Read TROUBLESHOOTING-FFlow.md** — For technical issues
4. **Open an issue** — If you find a bug, let us know

---

## 📈 Features Roadmap

- ✅ Multiple curve presets
- ✅ Real-time preview
- ✅ Precision control points
- ✅ Custom curve library (save/load unlimited curves)
- 🔜 Elastic-curve workspace
- 🔜 Bounce-curve workspace

---

## 🤝 Contributing

Found a bug? Have a feature request? We'd love to hear from you!

1. **Report Issues** — Open an issue with reproduction steps
2. **Suggest Features** — Describe your use case and desired outcome
3. **Share Presets** — Created a cool curve? Share it!

---

## 📄 License

Fusion Flow is provided as-is. See LICENSE for details.

---

## 🙏 Acknowledgments

Built with ❤️ for animators, motion designers, and VFX artists who demand precision.

Special thanks to the DaVinci Resolve community for the inspiration.

---

<div align="center">

### Ready to Transform Your Animations?

**[Download Fusion Flow](https://github.com/MisonLarp/Fusion-Flow/releases)** · **[Watch Tutorial](https://www.youtube.com/watch?v=keNc6KjVTOc)** · **[Report Issues](https://github.com/MisonLarp/Fusion-Flow/issues)**

*We built ts brick by brick*

</div>
