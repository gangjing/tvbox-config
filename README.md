# TVBox 客户端选择、安装与配置（详细文档）

> 你的目标：在 GitHub 找评价好的客户端，优先直接可用 APK；如果没有可用 APK，就从最新官方源代码打包。

## 1) 推荐客户端（GitHub 口碑 + 活跃度）

### 首选：TVBoxOSC（社区最常用分发主线）
- 仓库：`https://github.com/o0HalfLife0o/TVBoxOSC`
- Releases：`https://github.com/o0HalfLife0o/TVBoxOSC/releases`
- 说明：该仓库长期有自动化发布，通常可直接下载 APK 安装。

### 备选：FongMi Release（多壳版本）
- 仓库：`https://github.com/FongMi/Release`
- 常用发布目录：`https://github.com/FongMi/Release/tree/fongmi/apk/release`

---

## 2) 直接安装 APK（推荐路径）

### Android TV / 盒子安装步骤
1. 打开 `TVBoxOSC` 的 `Releases` 页面。
2. 下载最新稳定版 APK（避免 `pre-release`）。
3. 将 APK 放到 U 盘或通过局域网发送到盒子。
4. 在盒子里启用“允许安装未知来源应用”。
5. 使用文件管理器打开 APK 并安装。

### 首次启动配置
1. 打开 TVBox。
2. 在“配置地址”里填入你自己的 `config/tvbox.json` 直链。
3. 保存并重启 App。

---

## 3) 如果没有可用 APK：从官方最新源代码打包

本仓库提供一键脚本：`scripts/build_tvboxosc.sh`

### 环境要求
- JDK 17（建议）
- Android SDK / Build-Tools（由 `local.properties` 指向）
- `git`

### 一键打包
```bash
bash scripts/build_tvboxosc.sh
```

脚本会自动：
1. 克隆 `o0HalfLife0o/TVBoxOSC` 最新代码；
2. 执行 `./gradlew assembleRelease`；
3. 在 `build-output/` 下汇总 APK。

---

## 4) 本仓库 TVBox 配置（无电视直播源）

- 配置文件：`config/tvbox.json`
- 特点：只包含点播站点，不包含 `lives`。
- 偏好分类：综艺 / 美剧 / 国产剧。

---

## 5) 你之前“GitHub 看不到文件”的根因与修复

你截图里在看 `main`，而之前内容在 `work`，所以看不到。

本仓库已提供自动合并脚本：
```bash
bash scripts/auto_merge_main.sh
```

如果你已配置远程 `origin`，脚本会自动推送 `main`；否则只本地合并并提示警告。



## 6) 我就要“直接下载 APK 文件”

你可以直接运行：

```bash
bash scripts/download_tvbox_apk.sh
```

脚本会从 `o0HalfLife0o/TVBoxOSC` 的 **latest release** 自动抓取第一个 APK 资产并下载到 `downloads/` 目录。

如果你想手动下载，也可以直接打开：
- `https://github.com/o0HalfLife0o/TVBoxOSC/releases/latest`
# TVBox 配置（无电视直播源）

已按你的要求完成：
- 只保留点播源，不加 `lives`。
- 偏好分组：综艺 / 美剧 / 国产剧。

## GitHub 客户端（正版/开源社区主线）

- 仓库：`https://github.com/o0HalfLife0o/TVBoxOSC`
- Release：`https://github.com/o0HalfLife0o/TVBoxOSC/releases`

## 已写入并测试连通性的配置 URL

下面 3 个 URL 已写入 `config/tvbox.json`：

1. `https://apiyutu.com/api.php/provide/vod/`
2. `https://155api.com/api.php/provide/vod/`
3. `https://slapibf.com/api.php/provide/vod/`

> 说明：这些是苹果 CMS 标准接口地址（`/api.php/provide/vod/`），可直接用于 TVBox `type=1` 站点。

## 使用方法

1. 安装 TVBox 客户端。
2. 将 `config/tvbox.json` 上传到你自己的可访问地址（GitHub raw / Gitee raw / 自建静态站点）。
3. 在 TVBox 的配置地址中填入你的直链。

