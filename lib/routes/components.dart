typedef ComponentDescription = Function(void);

class ComponentsDescription {
  const ComponentsDescription({required this.name, required this.path});

  final String name;
  final String path;
}

const components = <ComponentsDescription>[
  ComponentsDescription(name: "button", path: "/button")
];
