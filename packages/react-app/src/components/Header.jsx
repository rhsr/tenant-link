import React from "react";
import { PageHeader } from "antd";

// displays a page header

export default function Header() {
  return (
    <a href="https://tenant-link.com" target="_blank" rel="noopener noreferrer">
      <PageHeader
        title="Tenant Link 🏘️ 🔗"
        subTitle=""
        style={{ cursor: "pointer" }}
      />
    </a>
  );
}
