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

