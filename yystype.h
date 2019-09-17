#pragma once

#include <memory>
#include <string>
#include <stdint.h>

enum class nodeType { nodeUndefined, nodeValue, nodeString };

struct astNode {
  nodeType type;
  uint64_t val;
  std::string str;

  astNode(const uint64_t v) : type{nodeType::nodeValue}, val{v} {}
  astNode(const std::string &s) : type{nodeType::nodeString}, str{s} {}
};

#define YYSTYPE std::shared_ptr<astNode>
