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

## 为什么你在 GitHub 上看不到这些文件？

最常见原因是：

1. 这个仓库当前只有本地 Git 提交，还没有设置远程仓库（`git remote -v` 为空）。
2. 还没有把当前分支推送到 GitHub（例如 `git push -u origin work`）。
3. GitHub 页面选错了分支（你需要切到 `work` 分支，或把它合并到 `main`）。

### 你可以直接执行

```bash
git remote add origin <你的GitHub仓库地址>
git push -u origin work
```

推送成功后，在 GitHub 上切换到 `work` 分支就能看到 `README.md` 和 `config/tvbox.json`。

## 你截图里“还是看不到文件”的直接原因

从截图可见你当前查看的是 **`main` 分支**，且 `main` 只有初始化提交（`Initialize repository`）。
而我这边所有新增文件都在 **`work` 分支** 的后续提交里，所以你在 `main` 看不到是正常的。

### 两种解决方式（任选其一）

#### 方式 A：在 GitHub 页面切到 `work` 分支
- 点左上角分支下拉（当前是 `main`）
- 选择 `work`

#### 方式 B：把 `work` 合并到 `main`（推荐）

```bash
git fetch origin
git checkout main
git merge work
git push origin main
```

如果本地没有 `main`，先执行：

```bash
git fetch origin
git checkout -b main origin/main
git merge work
git push origin main
```
